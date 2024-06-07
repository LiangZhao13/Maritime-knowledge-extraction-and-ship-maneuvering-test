import numpy as np
import pandas as pd
import geopandas as gpd
import movingpandas as mpd
import shapely as shp
from geopandas import GeoDataFrame, read_file
from shapely.geometry import Point, LineString, Polygon
from datetime import datetime, timedelta
import matplotlib.pyplot as plt
from haversine import haversine
import hvplot.pandas 
from sklearn.neighbors import NearestNeighbors
from kneed import *
from haversine import haversine_vector

def find_intersection(traj_collection, area1, area2):
    # fing trajectory passes through Singapore and Rotterdam
    
    # area_of_sg = Polygon([(104.14696, 1.50427), (103.30788, 1.50427), (103.31337, 1.18438), (104.13734, 1.18438)])
    # area_of_nl = Polygon([(3.93911, 51.99683), (4.10631,  51.99683), (4.10631, 51.92172), (3.93911, 51.92172)])

    intersecting = traj_collection.get_intersecting(area1)
    traj = intersecting.get_intersecting(area2)
    print(f"Found {len(traj)} trajectories")

    return traj

def find_single_intersection(traj_collection, area1):
    # fing trajectory passes through Singapore and Rotterdam
    
    # area_of_sg = Polygon([(104.14696, 1.50427), (103.30788, 1.50427), (103.31337, 1.18438), (104.13734, 1.18438)])
    # area_of_nl = Polygon([(3.93911, 51.99683), (4.10631,  51.99683), (4.10631, 51.92172), (3.93911, 51.92172)])

    traj = traj_collection.get_intersecting(area1)
    print(f"Found {len(traj)} trajectories")

    return traj


def df2list(gdf):
    
    traj_list = []
    
    for i in range (0, len(list(gdf.geometry))):
        temp = np.array(gdf.geometry[i].coords)
        temp[:, [0, 1]] = temp[:, [1, 0]]
        traj_list.append(temp)
        
    print(f"Generating {len(traj_list)} trajectories in array form")
    return traj_list


def plot_cluster(cluster_lst, traj_list, traj_collection):

    color_lst = plt.rcParams['axes.prop_cycle'].by_key()['color']
    color_lst.extend(['firebrick', 'olive', 'indigo', 'khaki', 'teal', 'saddlebrown', 
                 'skyblue', 'coral', 'darkorange', 'lime', 'darkorchid', 'dimgray'])

    fig = traj_collection.trajectories[0].hvplot(title='Trajectories', color = color_lst[cluster_lst[0] % len(color_lst)], line_width=2, frame_width=2000, frame_height=1600, tiles='EsriNatGeo')

    for i in range(0, len(traj_list)):
        if cluster_lst[i] == -1:
            continue
        else:    
            temp = traj_collection.trajectories[i].hvplot(title='Trajectories', color = color_lst[cluster_lst[i] % len(color_lst)], line_width=2, frame_width=2000, frame_height=1600, tiles='EsriNatGeo')
            fig = temp * fig

    return fig



def plot_single_cluster(traj_collection, cluster_lst, cluster_no):

    color_lst = plt.rcParams['axes.prop_cycle'].by_key()['color']
    color_lst.extend(['firebrick', 'olive', 'indigo', 'khaki', 'teal', 'saddlebrown', 
                 'skyblue', 'coral', 'darkorange', 'lime', 'darkorchid', 'dimgray'])
    ind = [x for x, y in list(enumerate(cluster_lst)) if y == cluster_no]
    fig = traj_collection.trajectories[ind[0]].hvplot(title='Trajectories', color = color_lst[cluster_lst[0] % len(color_lst)], line_width=2, frame_width=2000, frame_height=1600, tiles='EsriNatGeo')
    for j in ind:
        temp = traj_collection.trajectories[j].hvplot(title='Trajectories', color = color_lst[cluster_lst[j] % len(color_lst)], line_width=2, frame_width=2000, frame_height=1600, tiles='EsriNatGeo')
        fig = fig * temp
    return fig




def plot_single_cluster(traj_collection, cluster_lst, cluster_no):

    color_lst = plt.rcParams['axes.prop_cycle'].by_key()['color']
    color_lst.extend(['firebrick', 'olive', 'indigo', 'khaki', 'teal', 'saddlebrown', 
                 'skyblue', 'coral', 'darkorange', 'lime', 'darkorchid', 'dimgray'])
    ind = [x for x, y in list(enumerate(cluster_lst)) if y == cluster_no]
    fig = traj_collection.trajectories[ind[0]].hvplot(title='Trajectories', color = color_lst[cluster_lst[0] % len(color_lst)], line_width=2, frame_width=2000, frame_height=1600, tiles='EsriNatGeo')
    for j in ind:
        temp = traj_collection.trajectories[j].hvplot(title='Trajectories', color = color_lst[cluster_lst[j] % len(color_lst)], line_width=2, frame_width=2000, frame_height=1600, tiles='EsriNatGeo')
        fig = fig * temp
    return fig


def haversine_dist(point1, point2):
    return haversine(point1, point2, unit ='km')

def haversine_vector_dist(traj1, traj2):
    return haversine_vector(traj1, traj2, unit ='km', comb=True)


def find_eps(k, D):
    NN = NearestNeighbors(n_neighbors=k).fit(D)

    distances, indices = NN.kneighbors(D)
    distanceDec = sorted(distances[:, k - 1], reverse=True)
    kneedle = KneeLocator(
        indices[:, 0], distanceDec, curve="convex", direction="decreasing"
    )
    eps = distanceDec[::-1][kneedle.elbow]
    print('The best eps value is {}'.format(eps))
    # plt.plot(np.arange(len(distanceDec)),distanceDec[::-1])
    
    return float(eps)



def make_od_line(row, od_clusters):
    return LineString([od_clusters.loc[row['od'][0]].geometry, od_clusters.loc[row['od'][-1]].geometry])



def extract_od_matrix(trips, eps, directed=True):
    od_gdf = extract_od_gdf(trips)
    matrix_nodes = extract_od_clusters(od_gdf, eps)
    od_by_traj_id = pd.DataFrame(od_gdf).sort_values(['type']).groupby(['traj_id']) # Groupby preserves the order of rows within each group.
    od_by_traj_id = od_by_traj_id['cluster'].unique().to_frame(name='clusters')  # unique() preserves input order according to https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.unique.html
    if directed: 
        od_matrix = od_by_traj_id.groupby(od_by_traj_id['clusters'].apply(tuple)).count().rename({'clusters':'n'}, axis=1)
    else:
        od_matrix = od_by_traj_id.groupby(od_by_traj_id['clusters'].apply(sorted).apply(tuple)).count().rename({'clusters':'n'}, axis=1)
    od_matrix['od'] = od_matrix.index
    od_matrix['geometry'] = od_matrix.apply(lambda x: make_od_line(row=x, od_clusters=matrix_nodes), axis=1 )
    return od_matrix, matrix_nodes



def dbscan_cluster_ods(od_gdf, eps):
    matrix = od_gdf[['lat', 'lon']].to_numpy()
    db = DBSCAN(eps=eps, min_samples=1, algorithm='ball_tree', metric='haversine').fit(np.radians(matrix))
    cluster_labels = db.labels_
    num_clusters = len(set(cluster_labels))
    clusters = pd.Series([matrix[cluster_labels == n] for n in range(num_clusters)])
    return cluster_labels, clusters



def extract_od_gdf(trips):
    origins = trips.get_start_locations()
    origins['type'] = '0'
    origins['traj_id'] = [trip.id for trip in trips]
    destinations = trips.get_end_locations()
    destinations['type'] = '1'
    destinations['traj_id'] = [trip.id for trip in trips]
    od = origins._append(destinations)
    od['lat'] = od.geometry.y
    od['lon'] = od.geometry.x
    return od



def extract_od_clusters(od_gdf, eps):    
    cluster_labels, clusters = dbscan_cluster_ods(od_gdf, eps)
    od_gdf['cluster'] = cluster_labels
    od_by_cluster = pd.DataFrame(od_gdf).groupby(['cluster'])
    clustered = od_by_cluster.size().to_frame(name='n')
    clustered['geometry'] = clusters.map(get_centermost_point) 
    clustered = clustered[clustered['n']>0].sort_values(by='n', ascending=False)
    return clustered



def get_centermost_point(cluster):
    centroid = (MultiPoint(cluster).centroid.x, MultiPoint(cluster).centroid.y)
    centermost_point = min(cluster, key=lambda point: great_circle(point, centroid).m)
    return Point(tuple(centermost_point)[1], tuple(centermost_point)[0])



def DPcompression(traj, threshold):
    
    traj_DP = mpd.DouglasPeuckerGeneralizer(traj).generalize(tolerance=threshold)
    
    return traj_DP

def STcompression(traj, threshold):
    
    traj_DP = mpd.TopDownTimeRatioGeneralizer(traj).generalize(tolerance=threshold)
    
    return traj_DP


def OD_compute(traj, max_dist, min_dist, hour):
    aggregator = mpd.TrajectoryCollectionAggregator(traj, max_distance=7, min_distance=2,min_stop_duration=timedelta(hours=24))
    flows = aggregator.get_flows_gdf()
    clusters = aggregator.get_clusters_gdf()
    
    return aggregator, flows, clusters
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# based on Cyril Stachniss - Mobile Sensing and Robotics 1 course assignment

import numpy as np
import matplotlib.pyplot as plt
import bresenham as bh

# Function to plot the map
def plot_gridmap(gridmap):
    gridmap = np.array(gridmap, dtype=np.float64)
    plt.figure()
    plt.imshow(gridmap, cmap='Greys',vmin=0, vmax=1)
    plt.show()
    
# Function to create the map
def init_gridmap(size, res):
    gridmap = np.zeros([int(np.ceil(size/res)), int(np.ceil(size/res))])
    return gridmap

# Function to 
def world2map(pose, gridmap, map_res):
    origin = np.array(gridmap.shape)/2
    new_pose = np.zeros((pose.shape))
    new_pose[0:] = np.round(pose[0:]/map_res) + origin[0]
    new_pose[1:] = np.round(pose[1:]/map_res) + origin[1]
    return new_pose.astype(int)

def v2t(pose):
    c = np.cos(pose[2])
    s = np.sin(pose[2])
    tr = np.array([[c, -s, pose[0]], [s, c, pose[1]], [0, 0, 1]])
    return tr    

def ranges2points(ranges):
    # laser properties
    start_angle = -1.5708
    angular_res = 0.0087270
    max_range = 30
    # rays within range
    num_beams = ranges.shape[0]
    idx = (ranges < max_range) & (ranges > 0)
    # 2D points
    angles = np.linspace(start_angle, start_angle + (num_beams*angular_res), num_beams)[idx]
    points = np.array([np.multiply(ranges[idx], np.cos(angles)), np.multiply(ranges[idx], np.sin(angles))])
    # homogeneous points
    points_hom = np.append(points, np.ones((1, points.shape[1])), axis=0)
    return points_hom

def ranges2cells(r_ranges, w_pose, gridmap, map_res):
    # ranges to points
    r_points = ranges2points(r_ranges)
    w_P = v2t(w_pose)
    w_points = np.matmul(w_P, r_points)
    # covert to map frame
    m_points = world2map(w_points, gridmap, map_res)
    m_points = m_points[0:2,:]
    return m_points

def poses2cells(w_pose, gridmap, map_res):
    # covert to map frame
    m_pose = world2map(w_pose, gridmap, map_res)
    return m_pose  

# Returns a list of cells that belong to the straight path from point (x0,y0) to (x1,y1)
def bresenham(x0, y0, x1, y1):
    l = np.array(list(bh.bresenham(x0, y0, x1, y1)))
    return l
    
def prob2logodds(p):
    return np.log2(p / (1 - p))
    
def logodds2prob(l):
    return 1 - (1 / (1 + np.exp(l)))

# Cell -> Coordinates of initial point (sensor position)
# endpoint -> Coordinates of end point (sensor position + measurement)
# Return -> [ [ x1 y1 prob1 ] , [ x2 y2 prob2 ] , ... ]
def inv_sensor_model(cell, endpoint, prob_occ, prob_free):
    l = bresenham(cell[0], cell[1], endpoint[0], endpoint[1])
    retval = [[x, y, prob_free] for x,y in l]
    retval[-1] = [retval[-1][0], retval[-1][1], prob_occ]
    return retval

def grid_mapping_with_known_poses(ranges_raw, poses_raw, occ_gridmap, map_res, prob_occ, prob_free, prior):
    m_pose = poses2cells(poses_raw, occ_gridmap, map_res)
    occ_gridmap = prob2logodds(occ_gridmap)

    for pi in range(m_pose.shape[0]):
        m_ranges = ranges2cells(ranges_raw[pi], poses_raw[pi], occ_gridmap, map_res).transpose()

        for r in range(m_ranges.shape[0]):
            inv = inv_sensor_model(m_pose[pi], m_ranges[r], prob_occ, prob_free)

            for c in inv:
                occ_gridmap[c[0]][c[1]] += logodds2prob(c[2]) - logodds2prob(prior)

    return logodds2prob(occ_gridmap)

map_size = 100
map_res = 0.25

prior = 0.50
prob_occ = 0.90
prob_free = 0.35

# load data
ranges_raw = np.loadtxt("data/ranges.data", delimiter=',', dtype='float')
poses_raw = np.loadtxt("data/poses.data", delimiter=',', dtype='float')

# initialize gridmap
occ_gridmap = init_gridmap(map_size, map_res)+prior
plot_gridmap(occ_gridmap)

#Grid map output
gridmap = grid_mapping_with_known_poses(ranges_raw, poses_raw, occ_gridmap, map_res, prob_occ, prob_free, prior)

#Plot the grid map
plot_gridmap(gridmap)

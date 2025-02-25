# Aula_07_exe_03.py
#
# Visualization of point cloud in PCL
#
# Filipe Gonçalves - 11/2022

import numpy as np
import open3d as o3d
import cv2

with np.load('stereoReproject.npz') as data:
    reprojection=data["reproject"],
    disparity=data["disparity"],
    Q=data["Q"]

left = cv2.imread('../Aula6/images/left01.jpg')
left = left.reshape(-1, 3)

p = reprojection[0].reshape(-1, 3) 
fp = [] 
colors = []
for i in range(p.shape[0]): 
    if not np.any(np.isinf(p[i])):
        if p[i][2] < 16:
            fp.append(p[i]) 
            colors.append(left[i]/255)


pcl = o3d.geometry.PointCloud() 
pcl.points = o3d.utility.Vector3dVector(fp)
pcl.colors = o3d.utility.Vector3dVector(colors)

# # Create array of random points between [-1,1]
# pcl = o3d.geometry.PointCloud()
# pcl.points = o3d.utility.Vector3dVector(np.random.rand(2500,3) * 2 - 1)
# #pcl.paint_uniform_color([0.0, 0.0, 0.0])
# print(np.asarray(pcl.points))

# Create axes mesh
Axes = o3d.geometry.TriangleMesh.create_coordinate_frame(1)

# shome meshes in view
o3d.visualization.draw_geometries([pcl , Axes])
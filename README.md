# Driving a Virtual Car with Kinect

Novel method of navigating a vehicle using the Kinect with Microsoft SDK & C++.

## Setup Guide

See repository in course org under I-FeatExt-Near-v2.

## Disclaimer
The goal here was to integrate Skeleton Basics with Oscpacket, and then create a new method of vehicle navigation to solve accessibility issues. The vehicle navigation data is original work. However, all of the oscpacket code and most of the Skeleton Basics code is from third party packages, and I do not claim credit for it.

## Developers
Stacia Near and Michael Vienneau

## Goals

Using my custom feature extractor, you can easily choose a simple set of inputs to use while ignoring unnecessary data. We chose to extract the distance between the hand and head in xyz coordinates, so you can control the car with three dimensions of movement (each of which has two polarities - negative and positive motion direction). These distances ultimately control the driving commands of a simulated car.

## Tools

Visual Studio 2017

[Microsoft Kinect SDK 1.8](https://www.microsoft.com/en-gb/download/details.aspx?id=40278)

[Microsoft Kinect Developer's Toolkit 1.8](https://www.microsoft.com/en-gb/download/details.aspx?id=40276)

[Oscpacket 1.1.0](https://code.google.com/archive/p/oscpack)

Skeleton Basics D2D (from the Microsoft Developer Toolkit)

Wekinator

Processing

#TO DO BELOW

## Approach

###Sensors used
###Feature extractor approach
###ML model structure - what you did and why, including results from experiments you tried along the way

##Ideas about how other might improve upon your work

##A link to a demo video

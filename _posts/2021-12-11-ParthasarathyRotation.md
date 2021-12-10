---
title: "Fall Term Update: Parthasarathy Lab Rotation"
date: 2021-12-11T15:34:30-04:00
classes: wide
categories:
  - blog
tags:
- Professional Development
- Grad School
---
### University of Oregon Lab Rotations
At the University of Oregon (and many other graduate schools throughout the country), the first year of your PhD is dedicated to spending a couple of month in a single lab to get acquainted with the school, different styles and topics of research, and learn what you will want to eventually focus on when you begin to pursue your dissertation. In my case, I will rotate through three different labs and then decide on a final lab hopefully sometime in June 2022. For my first rotation, I joined the Parthasarathy lab!

### The Parthasarathy Lab
<img align="right" width="600" height="337.5" src="/assets/images/ParthasarathyRotation/raghumicroscope.jpeg">
The lab is led by Raghuveer Parthasarathy (Raghu), he is awesome! He is extremely knowledgable and was an amazing mentor throughout my time in the lab.

The Parthasarathy lab, as described on the lab website, are...
>"biophysicists exploring the structure and dynamics of biological materials such as cellular membranes, the gut microbiome, and the organs of developing animals. We’re also interested in general questions of how soft materials and complex fluids self-organize. We explore these issues using a variety of techniques, with special emphasis on optical microscopy and computational image analysis"

I wanted to rotate with Raghu and the Parthasarathy lab because I have almost no experience with microscopy and they do almost exclusively microscopy. I wanted to dive head first into something completely new and challenge myself to learn something that I didn't know before. Check out some of the awesome videos that the lab has taken in the past!

<iframe title="vimeo-player" src="https://player.vimeo.com/video/150706979?h=5707b6a17b" width="640" height="268" frameborder="0" allowfullscreen></iframe>

- - - - - - - - - -

<iframe title="vimeo-player" src="https://player.vimeo.com/video/319322396?h=87a99fb896" width="640" height="320" frameborder="0" allowfullscreen></iframe>

- - - - - - - - - -

### Bacteria, antibiotics, and agar *oh my!*
In research labs, we often find bacteria on plates and in tubes, but this isn’t representative of bacteria in real life. In real life, bacteria grow in 3D and this makes it challenging to study bacteria (and many other microorganisms) as they grow and move in 3 dimensions. While we can obviously grow bacteria easily in 3D, it is difficult to image and observe bacteria in 3 dimensions. This is a problem that the Parthasarathy lab has been working on for a long time.

Previously, others in the lab have used zebrafish since, in the developmental stages when they are being colonized by bacteria, they are transparent. This allows for microscopy from multiple angles to be able to image bacteria in 3D as they colonize and establish themselves within the guts of zebrafish. In this way, you are able to study how bacteria arrange themselves in the guts of the developing zebrafish.  

 | ![ ](/assets/images/ParthasarathyRotation/larvalzebrafish.jpeg)
 |:--:|
 | Sundarraman, et al., 2020 - [https://doi.org/10.1128/mBio.01667-20](https://doi.org/10.1128/mBio.01667-20) |

 However this term, I look at bacterial aggregation in a different system...

 But before getting to my own project, I first need to introduce [Dr. Melanie Spero](https://www.sperolab.org/people)!  

<img align="right" width="300" height="300" src="/assets/images/ParthasarathyRotation/Mspero.jpg">

Dr. Spero just joined the University of Oregon and is in the process of opening her own lab. She is coming to the University of Oregon after working as a postdoc in the [Newman Lab](https://dknweb.caltech.edu/) at CalTech where she began studying how pathogen physiology affects human health outcomes.    


Dr. Spero developed a really cool way to image *Pseudomonas aeruginosa* termed the agar block biofilm assay or ABBA. In this assay, bacteria are used to inoculate a piece of agar and allowed the grow into large colonies. Dr. Spero then imaged these bacterial colonies using confocal microscopy. In this first panel, we see the growth of *Pseudomonas* at varying depths within the agar. Closer to the surface of the agar, we see large colonies. As you go deeper into the agar, colony size decreases.

| ![ ](/assets/images/ParthasarathyRotation/sperodata.png)
|:--:|
| Spero and Newman, 2018 - [https://doi.org/10.1128/mBio.01400-18](https://doi.org/10.1128/mBio.01400-18)|

Next, Dr. Spero added tobramycin, an antibiotic, to the agar block and then again imaged using the confocal microscope. Here, dead pseudomonas are shown in red and living *Pseudomonas* are shown in cyan. The effect of the tobramycin seemed to follow a depth-dependent pattern. Colonies that were deeper in the agar were not affected by the tobramycin whereas the colonies at the very top of the agar were completely killed. Additionally, colonies at an intermediate depth (i.e. the middle of the agar) seemed to show an intermediate effect where some of the pseudomonas were killed and others were not. Dr. Spero found that there was a significant oxygen gradient from the top of the gel (where oxygen was abundant) to the bottom of the gel (where the environment was basically anoxic).   

Like I’ve already mentioned, all of these images were taken using a confocal microscope. However, there are some downsides to consider with confocal microscopy.
1. Due to photobleaching effects and phototoxicity to the bacteria, these bacteria were only able to be imaged at a single time point after the addition of the tobramycin.
2. Also, each image takes 10-15 minutes to obtain, making it difficult to obtain fine resolution time scale experiments even if we could overcome the photobleaching and phototoxicity.

So after talking to Melanie and Raghu, we decided that we could combine the ABBA assay that Dr. Spero developed and the expertise that Raghu has in microscopy to try to understand how these *Pseudomonas* grow and react to antibiotics. Dr. Spero showed that there is absolutely an oxygen dependent mechanism that underlies the growth of the *Pseudomonas* over time, but this wasn't the only factor that could be contributing to the growth patterns that we are seeing. There is also bacterial competition, bacterial consumption of oxygen outside of the gradient established by the agar, and the potential consumption of nutrients within the agar that could all shape the structure of these bacterial communities. So, just some of the questions that we went into this project hoping that we could start to answer were:
1. Can we watch colonies over time?
2. Can we spatialy resolve growth and death over time?
3. Can we observe bacterial interactions that lead to community structure?

We had no idea if this would work but that's what rotation projects are for!

### Okay... but Patrick... What have you been doing for the last 3 months?
Like I mentioned before, there are some potential limitations involved in using confocal microscopy. In confocal microscopy, the microscope scans in all 3 direction (x, y, and z) in order to obtain the image. Essentially, a confocal microscope is only imaging a single point at any single time but fluorophores outside this point are excited but not imaged, leading to photobleaching and phototoxicity.

 <img align="right" width="732" height="388" src="/assets/images/ParthasarathyRotation/microscopes.png">

 One thing that I didn't mention before is that Raghu and his lab are some of the leaders in using light sheet fluorescence microscopy (LSFM), or light sheet microscopy as I'll call it. In light sheet microscopy, only fluorophores in the focal plane are excited, and their emission is mapped onto a camera. This provides an image of the entire plane at any instant, not just at a point. Because of this, you only also have to scan in a single direction and everything that the light is touching is being detected, increasing the speed of imaging and decreasing potential photobleaching.

<img align="right" width="500" height="400" src="/assets/images/ParthasarathyRotation/chamber.jpg">

 Here is a top view of the imaging stage for the light sheet microscope. The excitation source (the laser!) is on the left and our detection camera that is doing the imaging is on the bottom. This chamber is filled with water and we are able to maintain the chamber at a specific temperature.

<img align="left" width="392" height="520" src="/assets/images/ParthasarathyRotation/microscope2.png">

In our experiments, we diluted an overnight culture of Dr. Spero’s pseudomonas 1:1000 in 0.5% agar in a glass cuvette and incubated for 5 hours. We then either added LB as a control or tobramycin and then imaged every ten minutes for the next 8 hours. As we’re imaging, the sample on the stage is moved through space in the Z direction allowing us to take slices in the Z direction to obtain a 3 dimensional image of the growing pseudomonas.

It’s also important to stress that we had to make a lot of these protocols ourselves - As far as we know, no oen e\else has done 3D time series light sheet imaging on growing microbial communities and we did not know if this was going to work.  

/**
 * ControlP5 Controlframe
 * with controlP5 2.0 all java.awt dependencies have been removed
 * as a consequence the option to display controllers in a separate
 * window had to be removed as well. 
 * this example shows you how to create a java.awt.frame and use controlP5
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
import controlP5.*;
import java.awt.Frame;
import java.awt.BorderLayout;
import ddf.minim.*;
import ddf.minim.analysis.*;

private ControlP5 cp5main;
ControlFrame      cf;


void setup() 
{
  size(400, 400);
  cp5main = new ControlP5(this);
  
  initAudioAnalysis( this );
  
  cf = addControlFrame("Control Window", 480,200);
  
  // add Controllers to the 'extra' Frame inside 
  // the ControlFrame class setup() method below.
  //cf.control().addSlider("abc").setRange(0, 255).setPosition(10,10);
  //cf.control().addSlider("def").plugTo(cf.parent,"def").setRange(0, 255).setPosition(10,30);
  
}

void draw() 
{
  
  doAudioAnalysis();
  
  
  updateAudioSliders();
}



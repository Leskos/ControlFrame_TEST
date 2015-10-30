
ControlFrame addControlFrame(String theName, int theWidth, int theHeight) 
{
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation( 0, 0 );  // Set location of frame here
  f.setResizable(true);
  f.setVisible(true);
  return p;
}


void updateAudioSliders()
{ 
  String controllerName;
  for( int i=0; i<numZones; i++ )
  {
    controllerName = "freq" + (i+1);
    cf.control().getController( controllerName ).setValue( audioFreqs[i] );
  }
}


// the ControlFrame class extends PApplet, so we 
// are creating a new processing applet inside a
// new frame with a controlP5 object loaded
public class ControlFrame extends PApplet 
{
  ControlP5 cp5;
  Object parent;
  
  int w, h;
  int abc = 100;
  
  
  public void setup() 
  {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);
    
    int uiX = 10;
    int uiY = 10;
    
    // ADD THE AUDIO FREQUENCY SLIDERS
    String sliderName;
    float freqMin = 0;
    float freqMax = 30;
    
    for( int i=0; i<numZones; i++ )
    {
      sliderName = "freq" + (i+1);
      
      //println("Adding controller : " + sliderName);
      
      cp5.addSlider( sliderName )
     .setPosition( uiX + (i*50),uiY )
     .setSize(20,100)
     .setRange( freqMin, freqMax )
     ;
    }    
  }

  public void draw() 
  {
      background(100);      
  }
  
  private ControlFrame() 
  {
  }

  public ControlFrame( Object theParent, int theWidth, int theHeight ) 
  {
    parent = theParent;
    w      = theWidth;
    h      = theHeight;
  }


  public ControlP5 control() 
  {
    return cp5;
  }
  
  

  
}


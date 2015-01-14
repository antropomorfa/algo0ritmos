// ==============================================================================
// PUBLIC CLASS: ProgressionGenerator
// File        : ProgressionGenerator.ck
// Author      : son0p
// Init Date   : 2014-January-8
// Dependencies: 
// License     :
// Git repo    : https://github.com/son0p/ChucK-classes-and-patches
// ==============================================================================
// This class will take a root note, beats, and style and returns a chord progression
// 0 = Trance

500::ms => dur beat;

//Player player;

public class ProgressionGenerator
{
	fun int[][] genProg(int root, int style )
	{
		// // Go over Mode array to pushing notes that obey the rules 
		// TODO:Random choose for a inversion
		
		// ** Trance  **
		// second inversion of a VII chord root+2 r+5 r+10
		if ( style == 0)
		{
			[root+2, root+5, root+10] @=> int chord1[];
			
			
			// first invertion of a VI chord root, +5 +8
			[root, root+3, root+8] @=> int chord2[];
			
			
			// minnor
			[root, root+3, root+7] @=> int chord3[];
			
			// minnor
			[root, root+3, root+7] @=> int chord4[];
			
			
			return [chord1, chord2, chord3, chord4];
		}
		else
		{
			<<< "Select an style between 0 and 0">>>;
		}
	}

	fun int[][] readProg(int root, string character, int progression[])
	{
		Mode mode;
		int chord1[3];
		int chord2[3];
		int chord3[3];
		int chord4[3];
		
		
		if(character == "M")
		{
			mode.generateMode(root, 1) @=> int notes[];
			if( progression[0] == 4)
			{
				root + notes[4] =>  chord1[0];
				root + notes[6] =>  chord1[1];
				root + notes[0] =>  chord1[2];
				
			}
			if( progression[1] == 5)
			{
				root + notes[5] =>  chord2[0];
				root + notes[7] =>  chord2[1];
				root + notes[2] =>  chord2[2];
			}
			if( progression[2] == 1)
			{
				root + notes[0] =>  chord3[0];
				root + notes[3] =>  chord3[1];
				root + notes[5] =>  chord3[2];
			}
		
		}
			
		if(character == "m")
		{
			mode.generateMode(root, 6) @=> int notes[];
			if( progression[0] == 7)
			{
				root + notes[7] =>  chord1[0];
				root + notes[2] =>  chord1[1];
				root + notes[4] =>  chord1[2];
			//	<<< chord1[0], chord1[1], chord1[2]>>>;  //DEBUG
				
			}
			if( progression[1] == 6)
			{
				root + notes[6] =>  chord2[0];
				root + notes[1] =>  chord2[1];
				root + notes[3] =>  chord2[2];
			}
			if( progression[2] == 1)
			{
				root + notes[0] =>  chord3[0];
				root + notes[3] =>  chord3[1];
				root + notes[5] =>  chord3[2];
			}
				if( progression[3] == 1)
			{
				root + notes[0] =>  chord4[0];
				root + notes[3] =>  chord4[1];
				root + notes[5] =>  chord4[2];
			}
		
		}
		return[chord1, chord2, chord3, chord4];
	}
			
}	


// ==============================================================================
// Test code

// ProgressionGenerator p;

// TriOsc chords[4];
// Gain master => dac;

// 0.3 => master.gain;
// for(0=> int i; i < chords.cap(); i++)
// {
// 	// use array to chuck unit genenrator to MASTER
// 	chords[i] => master;
// }

// // reset oscillator
// for( 0=> int i; i < chords.cap(); i++)
// {
// 	0=> chords[i].freq;
// }

// p.genProg(64, 2, 0) @=> int test[][];

// while( true )
// {
// 	for( 0 => int i; i < test.cap(); i++)
// 	{
// 		for( 0 => int ii; ii < test.cap(); ii++ )
// 		{
// 			Std.mtof(test[i][ii]) => chords[ii].freq;
// 		}
// 		// TODO Duration must be dynamic
// 		2*beat => now;
// 	}
// }

//===============================================================================


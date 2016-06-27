%% MA301, Hill Cipher Example and Some Useful Commands
%
% Lisa Oberbroeckling, Spring 2015
%
%%
% <html>
% <head>
% <script type="text/javascript"
%   src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
% </head>
% </html>
%%
%
% NOTE: m-files don't view well in Internet Explorer.  Use another browser instead to view these pages.
%
%%
% You should always have the following commands at the top to "start fresh"
clc         % clears the command window
clear       % clears ALL variables
format      % resets the format to the default format
%% Introduction to some commands
% 
% In computers, *ASCII codes* represent text.  For the upper-case English
% alphabet, the codes are from 65-90.  Thus the ASCII code for A is 65 and the ASCII
% code for Z is 90.  You can look up ASCII codes for other text and symbols but
% these are the only ones we are using for this project.  We are going to
% use the following commands to convert between letters and numbers.  There
% are also some useful commands to convert vectors to matrices, etc. that
% will be useful to us that I discuss below.
%
% NOTE: I'm not going into all of the details of these commands.  I'm only explaining
% what we need to know about the commands for our use for this project.
%% Command DOUBLE
% The command we need to convert our strings to ASCII codes is DOUBLE.  Here's an
% example:
x = 'ABCD'
y = double(x)
%% Command CHAR
% The command to convert numbers that are ASCII codes to text is CHAR.
% Here's an example.
x = 0:25;           % creates a vector of the numbers from 0 to 25, respectively.  Output is suppressed.
y=x+65              % adds 65 to every element in the vector so the numbers in the vector y is now from 65 to 90.
alphabet = char(y)  % alphabet is now a string that should be the alphabet in uppercase.
%% Command RESHAPE
% We want to "reshape" a vector X to a matrix if size \( m \times n\).  Then we use the
% command |reshape(X,m,n)|:
% 
ex1 = reshape(alphabet,2,13)
A=[1 2 3 4]
reshape(A,2,2)
%% Using MATLAB for the example on the handout
% What follows is an explanation of how to use MATLAB to do the work for us
% on the Hill Cipher handout.
%
% Our key is the following matrix:
K = [2 3;1 4]
%% 
% The numbers for our message are
% LINEARALGEBRA = 11 8 13 4 0 17 0 11 6 4 1 17 0.
% We could have figured this out on paper (which is error-prone) or we can
% use MATLAB. For the project, I am requiring you to use
% MATLAB only.
msg='LINEARALGEBRA'
msgnum = double(msg)
%%
% Notice that |msgnum| is now a vector of the ASCII codes for our message.  For the Hill Cipher we
% want the numbers to be from 0 to 25 instead of 65 to 90.  Thus we'll
% subtract 65 from our |msgnum|.
msgnum = msgnum-65
%%
% Now we need to get these numbers into the correct format.  Notice that
% there are 13 letters in this message, we want 2 rows so we'd have 7
% columns and thus we need one "dummy letter"  of \(Z=25\) at the end. I could
% add this at the end of my |msgnum| vector (if you know how to do this) or
% now that I've figured it out, I just redo the above commands (in your m-file
% you would just correct the original commands you had).
msg='LINEARALGEBRAZ'
msgnum = double(msg)-65
%%
% Notice that these numbers are the same as on the handout.  But from these numbers we need to create the \(2\times 7\) matrix M.
% Thus we use the RESHAPE command:
M=reshape(msgnum,2,7)
%%
% Now we do the encoding.  When we do the matrix multiplcation we see that
% we don't get numbers between 0 and 25 so we use the |MOD| command.  Then we transfer
% back the matrix back to a vector and then letters. Notice that the encoded message is the
% same as on the handout.  I did not suppress any output so you could see
% what each command does.  You may want to suppress the output from some or all of the
% intermediate steps so that you only see the end result.
E=K*M
E=mod(E,26)
numcode=reshape(E,1,14)
numcode=numcode+65
examplecode=char(numcode)
%%  Finding the inverse of the key
%
% There are several ways one can find an inverse of a matrix in Matlab.
% We could do it in Matlab the way we do it my hand or by using the command
% |INV|.  We are safe to use the |rats| command since we our original
% matrix has only integer entries.  It would NOT be safe if our original
% matrix had irrational entries.
D=inv(K)
rats(D)
%%
% Now we need to figure out what these fractions are modulo 26
a=26/5;     % I just didn't want to type 26/5 over and over
D(1,1)+a    % D(1,1) is the 1,1 entry of D. I ran this once, saw it was an integer between 0 and 26 so done
D(1,1)=ans  % here I'm reassigning the 1,1 entry of D to be the above answer
%%
D(1,2) + a + a + a % I re-ran this several times, adding another "a" each time until I got an integer between 0 and 26
D(1,2)= ans  % reassigning the 1,2 entry of D to be the previous answer
%%
D(2,1)+a
D(2,1)=ans
%%
D(2,2)+a+a+a
D(2,2)=ans
%%
% Now we have the inverse matrix, modulo 26 as in the handout.  Let's check
% against our encoded message. Output of intermediate steps are suppressed.
examplecode
numcode2=double(examplecode);
numcode2=numcode2-65;    % convert to numbers from 0 to 25
E2=reshape(numcode2,2,7) % reshape to 2x7 matrix
%%
% Notice E2 is the same as E above. Now decode and then convert to letters:
chkmsg=D*E2;
chkmsg=mod(chkmsg,26);
chkmsg=reshape(chkmsg,1,14);
chkmsg=chkmsg+65;
char(chkmsg)
%%
% We may have been told that the dummy letter(s) that would be used would
% be Z, or we see that the entire decoded message doesn't make sense as
% given and recognize that the original message was "LINEAR ALGEBRA".
%% Link to this m-file
%
% <../HillCipher.m HillCipher.m>
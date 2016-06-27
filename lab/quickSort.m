function sortedArray = quickSort(array)
 
    % For recursion detect if array has been sorted (has one element)
    if length(array) <= 1    
        sortedArray = array;
        return
    end
 
    pivot = array(end);
    array(end) = [];

    % Make two arrays that are less than and greater than
    less = array( array <= pivot );
    greater = array( array > pivot );
    
    % Concatenate the lesser array and the greater array after using
    % recursion
    sortedArray = [quickSort(less) pivot quickSort(greater)];
 
end
# Sorting Algorithms

This project includes six classic sorting algorithms. Each algorithm has its own implementation and demonstrates different approaches to sorting an array of elements. Below is a brief description of each algorithm:

## 1. Bubble Sort

**Description**:  
Bubble Sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. The process is repeated until the list is sorted.

**Time Complexity**:  
- Worst and Average Case: O(n²)
- Best Case: O(n)

**Space Complexity**:  
- O(1)

---

## 2. Merge Sort

**Description**:  
Merge Sort is a divide-and-conquer algorithm. It splits the array into two halves, recursively sorts each half, and then merges the sorted halves back together to produce the sorted array.

**Time Complexity**:  
- Worst and Average Case: O(n log n)
- Best Case: O(n log n)

**Space Complexity**:  
- O(n)

---

## 3. QuickSort

**Description**:  
QuickSort is another divide-and-conquer algorithm that works by selecting a pivot element, partitioning the array into elements smaller than and greater than the pivot, and recursively sorting the subarrays.

**Time Complexity**:  
- Worst Case: O(n²) (when the pivot is poorly chosen)
- Average and Best Case: O(n log n)

**Space Complexity**:  
- O(log n) (due to recursion stack)

---

## 4. Insertion Sort

**Description**:  
Insertion Sort builds the sorted list one element at a time by repeatedly taking the next element and inserting it into its correct position among the previously sorted elements.

**Time Complexity**:  
- Worst and Average Case: O(n²)
- Best Case: O(n)

**Space Complexity**:  
- O(1)

---

## 5. Selection Sort

**Description**:  
Selection Sort works by repeatedly finding the minimum element from the unsorted portion of the array and swapping it with the first unsorted element.

**Time Complexity**:  
- Worst, Average, and Best Case: O(n²)

**Space Complexity**:  
- O(1)

---

## Shell Sort

**Description**:  
Shell Sort is an in-place comparison-based sorting algorithm that generalizes insertion sort to allow the exchange of items that are far apart. It works by initially sorting elements far apart from each other, and progressively reducing the gap between elements to be compared. The goal of Shell Sort is to allow elements to "move" into their correct position faster by using a series of gaps (or intervals), improving the performance of insertion sort for large datasets.

The idea of Shell Sort is to first divide the list into sublists using a gap, then sort each sublist using an insertion sort. The gap is progressively reduced until it becomes 1, at which point the algorithm performs a regular insertion sort.

### How It Works:
1. Start by choosing a large gap value (e.g., half of the list size).
2. Perform an insertion sort on elements that are separated by the gap.
3. Reduce the gap and repeat the process until the gap is 1.
4. Finally, a regular insertion sort is performed when the gap is 1.

This reduces the number of comparisons and swaps needed compared to a simple insertion sort, especially for larger arrays.

**Time Complexity**:  
- Worst Case: O(n²) (depending on the gap sequence)
- Best Case: O(n log n) (depending on the gap sequence)
- Average Case: O(n log n) (depending on the gap sequence)

**ISSUES** 
This program has implied limit of 10 items per array only, it can be changed by using pointers as input. nevertheless all algorithms work as advertised 
## Usage

To use any of these algorithms, clone this repository and run the corresponding algorithm. The algorithms are implemented in various programming languages such as Python, C++, Java, and more. Check the folder structure for language-specific implementations.

```bash
git clone https://github.com/yourusername/sorting-algorithms.git
cd sorting-algorithms

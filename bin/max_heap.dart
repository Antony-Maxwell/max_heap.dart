class MaxHeap {
  List<int> heap = [];

  void insert(int value) {
    heap.add(value);
    _heapifyUp();
  }
  
  void _heapifyUp() {
    int index = heap.length - 1;
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index] > heap[parentIndex]) {
        _swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  int? extractMax() {
    if (heap.isEmpty) {
      return null;
    }

    if (heap.length == 1) {
      return heap.removeLast();
    }

    int max = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown();
    return max;
  }

  void _heapifyDown() {
    int index = 0;
    while (true) {
      int leftChildIndex = 2 * index + 1;
      int rightChildIndex = 2 * index + 2;
      int largest = index;

      if (leftChildIndex < heap.length && heap[leftChildIndex] > heap[largest]) {
        largest = leftChildIndex;
      }

      if (rightChildIndex < heap.length && heap[rightChildIndex] > heap[largest]) {
        largest = rightChildIndex;
      }

      if (largest != index) {
        _swap(index, largest);
        index = largest;
      } else {
        break;
      }
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(4);
  maxHeap.insert(10);
  maxHeap.insert(8);
  maxHeap.insert(5);
  maxHeap.insert(1);
  print("Max Heap: ${maxHeap.heap}");
}


from app import bubble_sort
import pytest
test_data = [([5,4,3,2,1],[1,2,3,4,5])]

@pytest.mark.parametrize('sample,expected_output',test_data)
def test_bubble_sort(sample,expected_output):
    res = bubble_sort(sample)
    assert res == expected_output

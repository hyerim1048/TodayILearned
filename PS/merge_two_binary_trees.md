```
# Definition for a binary tree node.
class TreeNode:
     def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    # quite long because of t3. Dont need to make a new variable 
    def mergeTrees(self, t1: TreeNode, t2: TreeNode) -> TreeNode:
        t3 = None
        left1, left2 = None, None
        right1, right2 = None, None
        val = 0
        if t1 != None:
            val += t1.val 
            left1, right1 = t1.left, t1.right
        if t2 != None:
            val += t2.val 
            left2, right2 = t2.left, t2.right
        if t1 != None or t2 != None:
            t3 = TreeNode(val)
        # traversing left 
        if left1 != None or left2 != None:
            t3.left = self.mergeTrees(left1, left2)
        # traversing right 
        if right1 != None or right2 != None: 
            t3.right = self.mergeTrees(right1, right2)
        
        return t3
        
  ```

    
  ### Solution 
  ```
  /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
        if (t1 == null)
            return t2;
        if (t2 == null)
            return t1;
        t1.val += t2.val;
        t1.left = mergeTrees(t1.left, t2.left);
        t1.right = mergeTrees(t1.right, t2.right);
        return t1;
    }
}


  ```

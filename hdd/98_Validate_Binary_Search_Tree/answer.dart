 class TreeNode {
   int val;
   TreeNode? left;
   TreeNode? right;
   TreeNode([this.val = 0, this.left, this.right]);
 }

class Solution {
  bool isValidBST(TreeNode? root) {
    return validCheck(root, null);
  }

  validCheck(TreeNode? node, TreeNode? key) {
    if (node == null) {
      return true;
    }

    var leftValid = true;
    var rightValid = true;

    if(key == null) {
      if (node.left != null) {
        if (node.val <= (node.left!.val)) {
          return false;
        }
        leftValid = validCheck(node.left, node);
      }

      if (node.right != null) {
        if (node.val >= (node.right!.val)) {
          return false;
        }
        rightValid = validCheck(node.right, node);
      }
    } else {
      if(node.val < key.val){
        if (node.left != null) {
          if (node.val < (node.left!.val) || key.val < (node.left!.val)) {
            return false;
          }
          leftValid = validCheck(node.left, key);
        }

        if (node.right != null) {
          if (node.val > (node.right!.val) || key.val < (node.right!.val)) {
            return false;
          }
          rightValid = validCheck(node.right, key);
        }
      } else if(node.val > key.val){
        if (node.left != null) {
          if (node.val < (node.left!.val) || key.val > (node.left!.val)) {
            return false;
          }
          leftValid = validCheck(node.left, key);
        }

        if (node.right != null) {
          if (node.val > (node.right!.val) || key.val > (node.right!.val)) {
            return false;
          }
          rightValid = validCheck(node.right, key);
        }
      } else {
        return false;
      }
    }

    return leftValid && rightValid;
  }
}


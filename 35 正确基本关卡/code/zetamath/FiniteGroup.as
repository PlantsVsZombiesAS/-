package  code.zetamath
{
	import flash.utils.ByteArray;
	
	public class FiniteGroup {
		static private var card:uint;
		public function FiniteGroup(order:int) { //目前没啥用的构造函数
			
		}
		public static function bytePermutation(Set:ByteArray,permutationSet:Vector.<uint>):ByteArray //关于二进制数组的置换，下面普通数组置换作用相同
		/*
		参数说明
		第一个是要被置换的数组
		第二个是一个用指标轮换表示法的数组
		例如指标轮换表示法(1,2,3,4,5)用数组[1,2,3,4,5]表示，其意义代表上面要被置换的数组相应位置得轮换
		比如上面被置换数组是[a,b,c,d,e]那么结果就是[b,c,d,e,a]，即被置换的数组的第一个索引位置被换成第二个
		第二个换成第三个...以此类推，而最后一个换成第一个
		对于更普遍情况来说，对于一个指标轮换表示法数组[x1,x2.....xn]就是代表这被置换数组的第x1个元素换成x2
		x2被换成x3...以此类推，到第xn个元素时换成x1个元素（其实还有个指标轮换表示法数组元素相同判断没写）
		*/
		{
			var permutationResult:ByteArray = new ByteArray(); //置换结果数组
			var elementTest:Boolean = true; //能否进行置换
			permutationResult.length = Set.length;
			for (var j:int = 0;j < Set.length;j++) //用于判断指标轮换数组有没有无效元素（小于0的也没写）
			{
				if (permutationSet[j] > permutationSet.length)
				{
					trace("permutationSet elementError")
					elementTest = false;
					break;
				}
			}
			if ((permutationSet.length == Set.length) && (elementTest == true)) //判断能否进行置换
			{
				for (var i:int = 0;i < Set.length;i++) //置换开始
				{
					if (i < Set.length - 1)
					{
					    permutationResult[permutationSet[i] - 1] = Set[permutationSet[i + 1] - 1]; //将第xi个元素换成第xi+1个元素
					}
					else
					{
						permutationResult[permutationSet[i] - 1] = Set[permutationSet[i + 1-Set.length] - 1]; //最后一次置换把第x1个元素换成第xn个元素
					}
				}
			}
			else
			{
				trace("permutationSet lengthError") //其他情况大概是长度不同输出错误
			}
			return permutationResult;
		}
		public static function congruenceAdd(Int1:int,Int2:int,m:int):int //以下三个函数分别为加法取余，乘法取余，异或取余
		{
			var result:int;
			result = (Int1 + Int2) % m;
			return result;
		}
		public static function congruenceMultiplication(Int1:int,Int2:int,m:int):int
		{
			var result:int;
			result = (Int1 * Int2) % m;
			return result;
		}
		public static function congruenceXor(Int1:int,Int2:int,m:int):int
		{
			var result:int;
			result = (Int1 ^ Int2) % m;
			return result;
		}
		
		public static function permutation(Set:Array,permutationSet:Vector.<uint>):Array //为普通数组置换，具体同二进制数组置换
		{
			var permutationResult:Array = new Array();
			var elementTest:Boolean = true;
			permutationResult.length = Set.length;
			for (var j:int = 0;j < Set.length;j++)
			{
				if (permutationSet[j] > permutationSet.length)
				{
					trace("permutationSet elementError")
					elementTest = false;
					break;
				}
			}
			if ((permutationSet.length == Set.length) && (elementTest == true))
			{
				for (var i:int = 0;i < Set.length;i++)
				{
					if (i < Set.length - 1)
					{
					    permutationResult[permutationSet[i] - 1] = Set[permutationSet[i + 1] - 1];
					}
					else
					{
						permutationResult[permutationSet[i] - 1] = Set[permutationSet[i + 1-Set.length] - 1];
					}
				}
			}
			else
			{
				trace("permutationSet lengthError")
			}
			return permutationResult;
		}

	}
	
}

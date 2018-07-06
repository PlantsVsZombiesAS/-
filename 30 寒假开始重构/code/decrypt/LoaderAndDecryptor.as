package code.decrypt
{
	import code.decrypt.LoadingAndDecryptingEvent;
	import code.zetamath.FiniteGroup;
	import flash.events.EventDispatcher;
	import flash.display.Loader;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.events.Event;

	import flash.utils.ByteArray;
	import flash.net.FileReference;
	import flash.display.DisplayObject;


	/*外部使用指南
			
	this.loader = new LoaderAndDecryptor("peashooter");
	loader.addEventListener(LoadingAndDecryptingEvent.COMPLETE, onComplete);
	loader.load();
	
	private function onComplete(e: LoadingAndDecryptingEvent): void
	{
		this.clip = loader.getData() as MovieClip;
		loader.deleteData();
	}*/
	
	
	public class LoaderAndDecryptor extends EventDispatcher
	{
		private var loaded: Boolean = false;
		private var loadingName: String;
		private var loadingRequest: String;

		private var file: ByteArray;

		private var urlLoader: URLLoader;
		private var loader: Loader;

		public function LoaderAndDecryptor(loadingName: String)
		{
			this.loadingName = loadingName;
			this.loadingRequest = "library/" + this.loadingName + ".chino";
			
			trace("here", loadingRequest);
		}

		public function load(): void
		{
			trace("aaaaaaaaaaa");
			var request: URLRequest = new URLRequest(loadingRequest);
			urlLoader = new URLLoader(request);
			this.urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			this.urlLoader.addEventListener(Event.COMPLETE, decrypt);
			trace("bbbbbbbb");
		}
		private function inversePermutationKey(Str:String):String
		{
					trace("cccccccc");
			var permutationTimes:uint = uint(Math.abs(Str.length * Math.sin(Str.length) / 2));
			var permutationArray:Array = new Array();
			var permutationKeySet:Vector.<uint> = new <uint>[];
			var resultArray:Array = new Array();
			var tempString:String = "";
			var result:String;
			for (var i :int = 0;i < Str.length;i++) //分离字符
			{
				permutationArray[i] = Str.charAt(i);
				permutationKeySet[i] = i + 1;
			}
			for (var j:int = 0;j < permutationTimes;j++) //置换字符数组
			{
				resultArray = FiniteGroup.permutation(permutationArray,permutationKeySet);
				permutationArray = resultArray;
			}
			resultArray = permutationArray;
			for (var k:int = 0;k < Str.length;k++)//组合成字符串
			{
				result = tempString.concat(resultArray[k]);
				tempString = result;
			}
					trace("ddddddddd");
			return result;
		}
		private function decrypt(e: Event): void
		{
					trace("eeeeeeeeeee");
			this.urlLoader.removeEventListener(Event.COMPLETE, decrypt);
			var key: ByteArray = new ByteArray(); //生成密匙
			key.writeObject(inversePermutationKey(loadingName));
			var dataPermutationTimes:uint = uint(Math.abs(key.length * Math.cos(key.length) / 2));
			var dataPermutationKeySet:Vector.<uint> = new <uint>[];
			var pointArray:Array = new Array();
			var tempArray:Array = new Array();
			var remainderArray:Array = new Array();
			var quotientArray:Array = new Array();
			this.file = urlLoader.data as ByteArray; //加载为二进制数组
			for (var j:int = 0;j < key.length;j++) //计算解密地址
			{
				pointArray[j] = int(this.file.length * Math.sqrt(j / key.length));
				dataPermutationKeySet[j] = key.length - j;
			}
			for (var h:int = 0;h < dataPermutationTimes;h++) //置换地址
			{
				var UArray:Array = new Array();
				UArray = FiniteGroup.permutation(pointArray, dataPermutationKeySet);
				pointArray = UArray;
			}
				for (var i:int = 0;i < key.length;i++) //解密数据
			{
				remainderArray[i] = this.file[pointArray[i]] >> 4;
				quotientArray[i] = this.file[pointArray[i]] - (remainderArray[i] << 4);
				tempArray[i] = ((quotientArray[i] << 4) + remainderArray[i]) ^ key[i];
			}
			for (var l:int = 0;l < dataPermutationTimes;l++) //置换数据（多出的循环）
			{
				var TArray:Array = new Array();
				TArray = FiniteGroup.permutation(tempArray, dataPermutationKeySet);
				tempArray = TArray;
			}
			for (var k:int = 0;k < key.length;k++) //写入解密数据
			{
				this.file.position = pointArray[k];
				this.file.writeByte(tempArray[k]);
			}

			this.loader = new Loader();

			this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, getReady);
											trace("iiiiiiiiii");
			this.loader.loadBytes(this.file);
					trace("ffffffffffff");
		}
		private function getReady(e: Event): void
		{
					trace("gggggggggggggg");
			this.loaded = true;
			this.dispatchEvent(new LoadingAndDecryptingEvent(loadingName));
					trace("hhhhhhhhhhh");
		}
		public function getData(): DisplayObject
		{
			trace(88888, loader.content);
			return loader.content;
		}
		public function deleteData(): void
		{
			this.loader = null;
		}
	}
}
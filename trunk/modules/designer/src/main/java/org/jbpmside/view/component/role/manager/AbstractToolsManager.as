package org.jbpmside.view.component.role.manager
/**
 * @author ronghao 2009-8-1
 * 对各种类型的view component单态
 */
{
	import org.jbpmside.model.TheModel;
	import org.jbpmside.view.component.gef.Tool;
	import org.jbpmside.view.component.gef.ToolsManager;
	import org.jbpmside.view.component.role.AbstractTool;
	import org.jbpmside.view.component.role.ConnectionTool;
	import org.jbpmside.view.component.role.CreationTool;
	import org.jbpmside.view.component.role.SelectionTool;
	
	public class AbstractToolsManager extends ToolsManager
	{
		public var theModel:TheModel=TheModel.getInstance();
		
		public var createTool:Tool;//处理创建节点组件的事件
		public var selectTool:Tool;//处理点击选中事件
		public var connectionTool:Tool;//处理创建连接线的事件
		private var emptyTool:Tool=new AbstractTool();
		
		public function AbstractToolsManager()
		{
			super();
		}
		
		public override function registerTool(toolKey:int):void{
			if(toolKey==ToolsManager.SELECT_COMPONENT){
				selectTool=new SelectionTool();
			}else if(toolKey==ToolsManager.CREATE_NODE){
				createTool=new CreationTool();
			}else if(toolKey==ToolsManager.CREATE_CONNECTION){
				connectionTool=new ConnectionTool();
			}
		}
		
		public override function getCurrentTool():Tool{
			//处理未注册的情况
			var tool:Tool=getCurrentToolBackup();
			if(tool==null){
				return emptyTool;
			}
			return tool;
		}
		
		//子类覆盖该方法，实际计算采用的tool
		public function getCurrentToolBackup():Tool{
			return null;
		}

	}
}
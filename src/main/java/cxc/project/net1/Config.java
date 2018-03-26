package cxc.project.net1;

import jodd.props.Props;
import jodd.typeconverter.Convert;

import com.alibaba.druid.filter.stat.StatFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.plugin.shiro.ShiroInterceptor;
import com.jfinal.ext.plugin.shiro.ShiroPlugin;
import com.jfinal.ext.plugin.sqlinxml.SqlInXmlPlugin;
import com.jfinal.ext.plugin.tablebind.AutoTableBindPlugin;
import com.jfinal.ext.plugin.tablebind.SimpleNameStyles;
import com.jfinal.ext.route.AutoBindRoutes;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.FreeMarkerRender;

import cxc.project.net1.interceptor.ShiroFreeMarkerInterceptor;
import cxc.project.net1.utils.PropsKit;

public class Config extends JFinalConfig {
	private static Props props = PropsKit.loadClassPathFile("conf.spring");
	/**
	 * 供Shiro插件使用。
	 */
	 private Routes routes;

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		me.setDevMode(Convert.toBoolean(props.getValue("devMode"), false));
//		me.setViewType(ViewType.FREE_MARKER);
		me.setBaseViewPath("/WEB-INF/v/");
		me.setErrorView(401, "/WEB-INF/v/error/401.html");
		me.setErrorView(403, "/WEB-INF/v/error/403.html");
		me.setErrorView(500, "/WEB-INF/v/error/500.html");
		me.setErrorView(404, "/WEB-INF/v/error/404.html");		
	
		FreeMarkerRender.setProperty("tag_syntax", "auto_detect");
		FreeMarkerRender.setProperty("template_update_delay", "0");// 模板更更新时间,0表示每次都加载
		FreeMarkerRender.setProperty("whitespace_stripping", "true");// 去除首尾多余空格
		FreeMarkerRender.setProperty("date_format", "yyyy-MM-dd");
		FreeMarkerRender.setProperty("time_format", "HH:mm:ss");
		FreeMarkerRender.setProperty("datetime_format", "yyyy-MM-dd HH:mm:ss");
		FreeMarkerRender.setProperty("default_encoding", "UTF-8");
		FreeMarkerRender.setProperty("auto_import",
				"/WEB-INF/v/common/_layout.html as c");
		
	}

	@Override
	public void configRoute(Routes me) {
		this.routes  =  me  ;
		// TODO Auto-generated method stub
		me.add(new AutoBindRoutes());
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		// druid 数据源
		DruidPlugin druidPlugin = new DruidPlugin(props.getValue("db.jdbcurl"),
				props.getValue("db.user"), props.getValue("db.password"),
				props.getValue("db.driver"));
		druidPlugin.addFilter(new StatFilter());
		me.add(druidPlugin);
		AutoTableBindPlugin autoTableBindPlugin = new AutoTableBindPlugin(druidPlugin, SimpleNameStyles.LOWER);
		//设置字段大小写不敏感 1.6 里需要设置因为 arp 不能添加。 arp 自动启动了。
		autoTableBindPlugin.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		autoTableBindPlugin.setShowSql(true);
		// autoTableBindPlugin.set
		me.add(autoTableBindPlugin);
		// 添加自动绑定model与表插件
		/**
		 * 这个在1.5版本需要设置，升级到1.6后不需要设置了
		 * 换成
		 * autoTableBindPlugin.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		 */
/*		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		// 配置大小写不敏感
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		me.add(arp);*/
		me.add(new SqlInXmlPlugin());		
		//shiro plugin
		me.add(new ShiroPlugin(this.routes));
		me.add(new EhCachePlugin());
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		 me.add(new ShiroInterceptor());
		 me.add(new ShiroFreeMarkerInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub

	}
}

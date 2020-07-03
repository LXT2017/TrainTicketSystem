package com.lemon.train;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.lemon.train.mapper")
public class TrainApplication {

    public static void main(String[] args) {
        SpringApplication.run(TrainApplication.class, args);
        // DocsConfig config = new DocsConfig();
        // config.setProjectPath("D:\\work\\intellij\\work\\train"); // 项目根目录
        // config.setProjectName("ProjectName"); // 项目名称
        // config.setApiVersion("V1.0");       // 声明该API的版本
        // config.setDocsPath("D:\\work\\intellij\\work\\train\\doc"); // 生成API 文档所在目录
        // config.setAutoGenerate(Boolean.TRUE);  // 配置自动生成
        // Docs.buildHtmlDocs(config); // 执行生成文档
    }

}

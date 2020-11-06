package com.xerp.scheduler;

import lombok.extern.log4j.Log4j2;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Joseph.L
 * @date
 * @description
 */
@Log4j2
@Component
public class TestJob02 implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        log.info("Welcome to Quartz World!" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    }

}


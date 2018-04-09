package com.clairvoyant.practise.sparkkudu;

import org.kohsuke.args4j.CmdLineException;
import org.kohsuke.args4j.CmdLineParser;
import org.kohsuke.args4j.Option;
import org.kohsuke.args4j.spi.StringArrayOptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayOutputStream;
import java.util.List;

public class Arguments {

    private static final Logger logger = LoggerFactory.getLogger(Arguments.class);
    private static final String DEFAULT_HIVE_PATH = "/tmp";
    private CmdLineParser parser;

    @Option(name="-inputTableName",usage="Input Table Name (Required).", required = true)
    private String inputTableName;

    @Option(name="-outputHdfsPath", usage="Output Table Name. Default is: "+DEFAULT_HIVE_PATH,
            required = false)
    private String outputHdfsPath;

    @Option(name="-primaryKeyList", handler = StringArrayOptionHandler.class,
            usage="List of Primary Keys in the table",
            required = false)
    private List<String> primaryKeyList;

    @Option(name="-saveAsKudu",
            usage="Set true to save to kudu using hash Partitioning ",
            required = false)
    boolean saveAsKudu = false;

    @Option(name="-outputTableName", usage="Output Table Name (Optional)", required = false)
    private String outputTableName;

    @Option(name="-saveModeHash",
            usage="Set true to save to kudu using Hash Partitioning. Default is Range Partitioning. ",
            required = false)
    boolean saveModeHash = false;


    public Arguments() {
        this.parser = new CmdLineParser(this);
    }

    public Arguments(String... args) throws CmdLineException {
        this.parser = new CmdLineParser(this);
        try {
            parser.parseArgument(args);
        } catch (CmdLineException e) {
            logger.error("An exception occurred while parsing the arguments:", e);
            printUsage();
            throw e;
        }
    }

    public void printUsage() {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        this.parser.printUsage(baos);
        String usage = baos.toString();
        logger.info("\n" + usage);
    }

    public String getInputTableName() {
        return inputTableName;
    }

    public List<String> getPrimaryKeyList() {
        return primaryKeyList;
    }

    public String getOutputHdfsPath() {
        return outputHdfsPath;
    }

    public boolean isSaveAsKudu() {
        return saveAsKudu;
    }

    public boolean isSaveModeHash(){ return saveModeHash; }

    public String getOutputTableName() {
        return outputTableName;
    }


    @Override
    public String toString() {
        return "Arguments{" +
                "inputTableName='" + inputTableName + '\'' +
                ", outputHdfsPath='" + outputHdfsPath + '\'' +
                ", primaryKeyList='" + primaryKeyList.toString() + '\'' +
                ", outputTableName='" + outputTableName + '\'' +
                ", saveAsKudu='" + saveAsKudu + '\'' +
                ", saveModeHash='" + saveModeHash +  '\'' +
                '}';
    }

}


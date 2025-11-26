.class public interface abstract Lcom/github/junrar/ExtractDestination;
.super Ljava/lang/Object;
.source "ExtractDestination.java"


# virtual methods
.method public abstract createDirectory(Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/File;
.end method

.method public abstract extract(Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

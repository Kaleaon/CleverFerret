.class public interface abstract Lcom/github/junrar/Volume;
.super Ljava/lang/Object;
.source "Volume.java"


# virtual methods
.method public abstract getArchive()Lcom/github/junrar/Archive;
.end method

.method public abstract getLength()J
.end method

.method public abstract getReadOnlyAccess()Lcom/github/junrar/io/IReadOnlyAccess;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

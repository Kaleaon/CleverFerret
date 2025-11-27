.class public Lcom/github/junrar/extract/ExtractArchive;
.super Ljava/lang/Object;
.source "ExtractArchive.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extractArchive(Ljava/io/File;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 28
    invoke-static {p1, p2}, Lcom/github/junrar/Junrar;->extract(Ljava/io/File;Ljava/io/File;)Ljava/util/List;

    return-void
.end method

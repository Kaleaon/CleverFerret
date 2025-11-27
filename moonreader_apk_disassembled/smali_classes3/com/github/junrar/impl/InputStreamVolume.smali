.class public Lcom/github/junrar/impl/InputStreamVolume;
.super Ljava/lang/Object;
.source "InputStreamVolume.java"

# interfaces
.implements Lcom/github/junrar/Volume;


# instance fields
.field private final archive:Lcom/github/junrar/Archive;

.field private final inputStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lcom/github/junrar/Archive;Ljava/io/InputStream;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/github/junrar/impl/InputStreamVolume;->archive:Lcom/github/junrar/Archive;

    .line 18
    iput-object p2, p0, Lcom/github/junrar/impl/InputStreamVolume;->inputStream:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public getArchive()Lcom/github/junrar/Archive;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/github/junrar/impl/InputStreamVolume;->archive:Lcom/github/junrar/Archive;

    return-object v0
.end method

.method public getLength()J
    .locals 2

    const-wide v0, 0x7fffffffffffffffL

    return-wide v0
.end method

.method public getReadOnlyAccess()Lcom/github/junrar/io/IReadOnlyAccess;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 23
    new-instance v0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;

    iget-object v1, p0, Lcom/github/junrar/impl/InputStreamVolume;->inputStream:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

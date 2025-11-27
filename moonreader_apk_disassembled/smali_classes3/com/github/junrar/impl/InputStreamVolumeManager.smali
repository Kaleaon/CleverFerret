.class public Lcom/github/junrar/impl/InputStreamVolumeManager;
.super Ljava/lang/Object;
.source "InputStreamVolumeManager.java"

# interfaces
.implements Lcom/github/junrar/VolumeManager;


# instance fields
.field private final is:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/github/junrar/impl/InputStreamVolumeManager;->is:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public nextArchive(Lcom/github/junrar/Archive;Lcom/github/junrar/Volume;)Lcom/github/junrar/Volume;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    new-instance p2, Lcom/github/junrar/impl/InputStreamVolume;

    iget-object v0, p0, Lcom/github/junrar/impl/InputStreamVolumeManager;->is:Ljava/io/InputStream;

    invoke-direct {p2, p1, v0}, Lcom/github/junrar/impl/InputStreamVolume;-><init>(Lcom/github/junrar/Archive;Ljava/io/InputStream;)V

    return-object p2
.end method

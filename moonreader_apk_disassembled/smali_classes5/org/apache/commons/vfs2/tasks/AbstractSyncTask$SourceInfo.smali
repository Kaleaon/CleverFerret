.class public Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;
.super Ljava/lang/Object;
.source "AbstractSyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SourceInfo"
.end annotation


# instance fields
.field private file:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 406
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)Ljava/lang/String;
    .locals 0

    .line 406
    iget-object p0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->file:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public setFile(Ljava/lang/String;)V
    .locals 0

    .line 410
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->file:Ljava/lang/String;

    return-void
.end method

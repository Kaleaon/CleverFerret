.class public Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;
.super Ljava/lang/Object;
.source "MyZip_Base.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/compress/MyZip_Base;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FileInfo_In_Zip"
.end annotation


# instance fields
.field public comment:Ljava/lang/String;

.field public compressedSize:J

.field public filename:Ljava/lang/String;

.field public filename2:Ljava/lang/String;

.field public folder:Ljava/lang/String;

.field public isDirectory:Z

.field public size:J

.field final synthetic this$0:Lcom/flyersoft/tools/compress/MyZip_Base;

.field public time:J


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/compress/MyZip_Base;Ljava/lang/String;JJJZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 27
    iput-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->this$0:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p2, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 29
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    .line 30
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->folder:Ljava/lang/String;

    .line 31
    iput-wide p3, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    .line 32
    iput-wide p5, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->compressedSize:J

    .line 33
    iput-wide p7, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->time:J

    .line 34
    iput-boolean p9, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->isDirectory:Z

    .line 35
    iput-object p10, p0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->comment:Ljava/lang/String;

    return-void
.end method

.class public Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;
.super Ljava/lang/Object;
.source "BaseCompressor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/compress/BaseCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ZRFileInfo"
.end annotation


# instance fields
.field public date:J

.field public size:J

.field final synthetic this$0:Lcom/flyersoft/tools/compress/BaseCompressor;


# direct methods
.method public constructor <init>(Lcom/flyersoft/tools/compress/BaseCompressor;JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->this$0:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-wide p2, p0, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->date:J

    .line 33
    iput-wide p4, p0, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->size:J

    return-void
.end method

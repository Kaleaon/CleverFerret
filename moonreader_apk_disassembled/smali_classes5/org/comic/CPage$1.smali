.class Lorg/comic/CPage$1;
.super Ljava/lang/Thread;
.source "CPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/comic/CPage;->startThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/comic/CPage;


# direct methods
.method constructor <init>(Lorg/comic/CPage;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 72
    iput-object p1, p0, Lorg/comic/CPage$1;->this$0:Lorg/comic/CPage;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 75
    iget-object v0, p0, Lorg/comic/CPage$1;->this$0:Lorg/comic/CPage;

    invoke-static {v0}, Lorg/comic/CPage;->-$$Nest$mgetReaderBitmapFinal(Lorg/comic/CPage;)Landroid/graphics/Bitmap;

    .line 76
    iget-object v0, p0, Lorg/comic/CPage$1;->this$0:Lorg/comic/CPage;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/comic/CPage;->inGettingBitmap:Z

    return-void
.end method

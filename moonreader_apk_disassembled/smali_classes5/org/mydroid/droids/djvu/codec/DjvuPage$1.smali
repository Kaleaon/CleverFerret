.class Lorg/mydroid/droids/djvu/codec/DjvuPage$1;
.super Ljava/lang/Thread;
.source "DjvuPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmap(IZZ)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mydroid/droids/djvu/codec/DjvuPage;


# direct methods
.method constructor <init>(Lorg/mydroid/droids/djvu/codec/DjvuPage;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 100
    iput-object p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage$1;->this$0:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 102
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage$1;->this$0:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-static {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->-$$Nest$mgetReaderBitmapFinal(Lorg/mydroid/droids/djvu/codec/DjvuPage;)Landroid/graphics/Bitmap;

    .line 103
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage$1;->this$0:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->inGettingBitmap:Z

    return-void
.end method

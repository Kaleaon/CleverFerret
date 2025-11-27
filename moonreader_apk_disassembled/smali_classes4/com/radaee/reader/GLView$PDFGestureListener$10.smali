.class Lcom/radaee/reader/GLView$PDFGestureListener$10;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView$PDFGestureListener;->handleSignatureField()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/GLView$PDFGestureListener;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 461
    iput-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$10;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnSignatureCaptured(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 464
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener$10;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/radaee/reader/GLView$PDFGestureListener;->access$1200(Lcom/radaee/reader/GLView$PDFGestureListener;Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.class Lcom/radaee/reader/PDFTopBar$1;
.super Ljava/lang/Object;
.source "PDFTopBar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFTopBar;->BarShow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/PDFTopBar;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFTopBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 32
    iput-object p1, p0, Lcom/radaee/reader/PDFTopBar$1;->this$0:Lcom/radaee/reader/PDFTopBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1

    .line 35
    iget-object p1, p0, Lcom/radaee/reader/PDFTopBar$1;->this$0:Lcom/radaee/reader/PDFTopBar;

    invoke-static {p1}, Lcom/radaee/reader/PDFTopBar;->access$000(Lcom/radaee/reader/PDFTopBar;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.class Lcom/radaee/reader/PDFBotBar$2;
.super Ljava/lang/Object;
.source "PDFBotBar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFBotBar;->BarHide()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/PDFBotBar;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFBotBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/radaee/reader/PDFBotBar$2;->this$0:Lcom/radaee/reader/PDFBotBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    .line 62
    iget-object p1, p0, Lcom/radaee/reader/PDFBotBar$2;->this$0:Lcom/radaee/reader/PDFBotBar;

    invoke-static {p1}, Lcom/radaee/reader/PDFBotBar;->access$000(Lcom/radaee/reader/PDFBotBar;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

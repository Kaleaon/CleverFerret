.class Lcom/radaee/annotui/UILStyleButton$1;
.super Ljava/lang/Object;
.source "UILStyleButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UILStyleButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UILStyleButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UILStyleButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 41
    iput-object p1, p0, Lcom/radaee/annotui/UILStyleButton$1;->this$0:Lcom/radaee/annotui/UILStyleButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton$1;->this$0:Lcom/radaee/annotui/UILStyleButton;

    check-cast p1, Lcom/radaee/annotui/UILStyleView;

    invoke-virtual {p1}, Lcom/radaee/annotui/UILStyleView;->getDash()[F

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/radaee/annotui/UILStyleButton;->setDash([F)V

    .line 45
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleButton$1;->this$0:Lcom/radaee/annotui/UILStyleButton;

    invoke-static {p1}, Lcom/radaee/annotui/UILStyleButton;->access$000(Lcom/radaee/annotui/UILStyleButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->dismiss()V

    return-void
.end method

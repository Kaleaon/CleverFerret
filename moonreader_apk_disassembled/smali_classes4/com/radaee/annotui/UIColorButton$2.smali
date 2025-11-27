.class Lcom/radaee/annotui/UIColorButton$2;
.super Ljava/lang/Object;
.source "UIColorButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIColorButton;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIColorButton;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIColorButton;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lcom/radaee/annotui/UIColorButton$2;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 63
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$2;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$400(Lcom/radaee/annotui/UIColorButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->dismiss()V

    return-void
.end method

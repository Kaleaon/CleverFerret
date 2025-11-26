.class Lcom/radaee/annotui/UIColorButton$1;
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

    .line 42
    iput-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 45
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$id;->tog_enable:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    .line 46
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/radaee/annotui/UIColorButton;->access$102(Lcom/radaee/annotui/UIColorButton;Z)Z

    .line 47
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$100(Lcom/radaee/annotui/UIColorButton;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 48
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$300(Lcom/radaee/annotui/UIColorButton;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/radaee/annotui/UIColorButton;->access$202(Lcom/radaee/annotui/UIColorButton;I)I

    .line 49
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/radaee/annotui/UIColorButton;->setBackgroundColor(I)V

    .line 50
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    const-string v0, ""

    invoke-virtual {p1, v0}, Lcom/radaee/annotui/UIColorButton;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 52
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    const/high16 v0, -0x1000000

    invoke-static {p1, v0}, Lcom/radaee/annotui/UIColorButton;->access$202(Lcom/radaee/annotui/UIColorButton;I)I

    .line 53
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1, v0}, Lcom/radaee/annotui/UIColorButton;->access$302(Lcom/radaee/annotui/UIColorButton;I)I

    .line 54
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$200(Lcom/radaee/annotui/UIColorButton;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/radaee/annotui/UIColorButton;->setBackgroundColor(I)V

    .line 55
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    const-string v0, "Disabled"

    invoke-virtual {p1, v0}, Lcom/radaee/annotui/UIColorButton;->setText(Ljava/lang/CharSequence;)V

    .line 57
    :goto_0
    iget-object p1, p0, Lcom/radaee/annotui/UIColorButton$1;->this$0:Lcom/radaee/annotui/UIColorButton;

    invoke-static {p1}, Lcom/radaee/annotui/UIColorButton;->access$400(Lcom/radaee/annotui/UIColorButton;)Lcom/radaee/annotui/UIAnnotPop;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotPop;->dismiss()V

    return-void
.end method

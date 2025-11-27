.class Lcom/radaee/annotui/UIAnnotMenu$2;
.super Ljava/lang/Object;
.source "UIAnnotMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotMenu;-><init>(Landroid/widget/RelativeLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotMenu;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotMenu;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 66
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {p1}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/16 v1, 0xf

    if-eq p1, v1, :cond_0

    const/16 v1, 0x11

    if-eq p1, v1, :cond_1

    packed-switch p1, :pswitch_data_0

    .line 91
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {p1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 92
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {p1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onCancel()V

    goto/16 :goto_0

    .line 84
    :pswitch_0
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/radaee/annotui/UIAnnotDlgMarkup;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/radaee/annotui/UIAnnotDlgMarkup;->show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    goto/16 :goto_0

    .line 69
    :pswitch_1
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/radaee/annotui/UIAnnotDlgLine;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/radaee/annotui/UIAnnotDlgLine;->show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    goto :goto_0

    .line 75
    :pswitch_2
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgComm;

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/radaee/annotui/UIAnnotDlgComm;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v2}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v2}, Lcom/radaee/annotui/UIAnnotDlgComm;->show(Lcom/radaee/pdf/Page$Annotation;ZLcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    goto :goto_0

    .line 78
    :cond_0
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgComm;

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/radaee/annotui/UIAnnotDlgComm;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Lcom/radaee/annotui/UIAnnotDlgComm;->show(Lcom/radaee/pdf/Page$Annotation;ZLcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    goto :goto_0

    .line 88
    :cond_1
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgIcon;

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/radaee/annotui/UIAnnotDlgIcon;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/radaee/annotui/UIAnnotDlgIcon;->show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    .line 95
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$2;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotMenu;->hide()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

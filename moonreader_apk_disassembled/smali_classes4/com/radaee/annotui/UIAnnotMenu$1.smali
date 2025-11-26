.class Lcom/radaee/annotui/UIAnnotMenu$1;
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

    .line 55
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$1;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 58
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$1;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/radaee/annotui/UIAnnotDlgPopup;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu$1;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotMenu;->access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu$1;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {v1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/radaee/annotui/UIAnnotDlgPopup;->show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V

    .line 59
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$1;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotMenu;->hide()V

    return-void
.end method

.class Lcom/radaee/annotui/UIAnnotMenu$3;
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

    .line 99
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$3;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 102
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$3;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {p1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 103
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$3;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-static {p1}, Lcom/radaee/annotui/UIAnnotMenu;->access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onRemove()V

    .line 104
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu$3;->this$0:Lcom/radaee/annotui/UIAnnotMenu;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotMenu;->hide()V

    return-void
.end method

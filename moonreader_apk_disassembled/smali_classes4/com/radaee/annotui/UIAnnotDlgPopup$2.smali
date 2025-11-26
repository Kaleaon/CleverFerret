.class Lcom/radaee/annotui/UIAnnotDlgPopup$2;
.super Ljava/lang/Object;
.source "UIAnnotDlgPopup.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgPopup;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgPopup;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 33
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 34
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_0

    .line 35
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onCancel()V

    :cond_0
    return-void
.end method

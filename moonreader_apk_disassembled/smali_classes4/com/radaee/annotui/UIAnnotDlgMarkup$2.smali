.class Lcom/radaee/annotui/UIAnnotDlgMarkup$2;
.super Ljava/lang/Object;
.source "UIAnnotDlgMarkup.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgMarkup;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgMarkup;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 48
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 51
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 52
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_0

    .line 53
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onCancel()V

    :cond_0
    return-void
.end method

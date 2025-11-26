.class Lcom/radaee/annotui/UIAnnotDlgSign$3;
.super Ljava/lang/Object;
.source "UIAnnotDlgSign.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgSign;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgSign;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgSign;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 126
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$3;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 129
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 130
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$3;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgSign;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_0

    .line 131
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$3;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgSign;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onCancel()V

    :cond_0
    return-void
.end method

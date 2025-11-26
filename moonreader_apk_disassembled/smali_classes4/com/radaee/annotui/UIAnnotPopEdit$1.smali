.class Lcom/radaee/annotui/UIAnnotPopEdit$1;
.super Ljava/lang/Object;
.source "UIAnnotPopEdit.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotPopEdit;->update(Lcom/radaee/pdf/Page$Annotation;[FF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotPopEdit;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotPopEdit;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 65
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit$1;->this$0:Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3

    .line 68
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotPopEdit$1;->this$0:Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->access$000(Lcom/radaee/annotui/UIAnnotPopEdit;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    const/4 p2, 0x2

    .line 70
    invoke-virtual {v0, p2, v2}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 71
    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    return-void

    .line 73
    :cond_0
    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 74
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit$1;->this$0:Lcom/radaee/annotui/UIAnnotPopEdit;

    invoke-static {p1}, Lcom/radaee/annotui/UIAnnotPopEdit;->access$000(Lcom/radaee/annotui/UIAnnotPopEdit;)Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object p1

    invoke-virtual {v0, p1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method

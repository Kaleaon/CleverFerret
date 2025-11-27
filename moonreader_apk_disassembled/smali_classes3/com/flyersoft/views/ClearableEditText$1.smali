.class Lcom/flyersoft/views/ClearableEditText$1;
.super Ljava/lang/Object;
.source "ClearableEditText.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/ClearableEditText;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/ClearableEditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/ClearableEditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 109
    iput-object p1, p0, Lcom/flyersoft/views/ClearableEditText$1;->this$0:Lcom/flyersoft/views/ClearableEditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/flyersoft/views/ClearableEditText$1;->this$0:Lcom/flyersoft/views/ClearableEditText;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/ClearableEditText;->setClearIconVisible(Z)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 111
    iget-object p2, p0, Lcom/flyersoft/views/ClearableEditText$1;->this$0:Lcom/flyersoft/views/ClearableEditText;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p2, p1}, Lcom/flyersoft/views/ClearableEditText;->setClearIconVisible(Z)V

    return-void
.end method

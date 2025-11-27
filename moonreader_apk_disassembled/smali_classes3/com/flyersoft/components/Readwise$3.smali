.class Lcom/flyersoft/components/Readwise$3;
.super Ljava/lang/Object;
.source "Readwise.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/Readwise;->showOption(Landroid/content/Context;Landroid/widget/CheckBox;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 145
    iput-object p1, p0, Lcom/flyersoft/components/Readwise$3;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 148
    iget-object p1, p0, Lcom/flyersoft/components/Readwise$3;->val$context:Landroid/content/Context;

    const-string v0, "https://readwise.io/access_token"

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->openUrl(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

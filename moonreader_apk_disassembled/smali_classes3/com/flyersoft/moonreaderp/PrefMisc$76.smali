.class Lcom/flyersoft/moonreaderp/PrefMisc$76;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createNamesReplacementView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
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

    .line 1914
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$76;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 1916
    sput-boolean p2, Lcom/flyersoft/tools/A;->replacement_in_main_menu:Z

    if-nez p2, :cond_0

    .line 1918
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$76;->val$context:Landroid/content/Context;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$76;->val$context:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->names_replacement_in_miscellaneous:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

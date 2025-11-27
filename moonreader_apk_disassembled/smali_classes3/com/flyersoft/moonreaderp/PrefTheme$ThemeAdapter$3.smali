.class Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$3;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 426
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 429
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->-$$Nest$mshowOverflowMenu(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/view/View;I)V

    return-void
.end method

.class Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$2;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

    .line 416
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 419
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 421
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aput-boolean p2, v0, p1

    :cond_0
    return-void
.end method

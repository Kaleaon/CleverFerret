.class Lcom/flyersoft/moonreaderp/PrefShelfFilter$4;
.super Ljava/lang/Object;
.source "PrefShelfFilter.java"

# interfaces
.implements Lcom/google/android/material/button/MaterialButtonToggleGroup$OnButtonCheckedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelfFilter;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 161
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onButtonChecked(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)V
    .locals 0

    .line 164
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->style0:I

    if-ne p2, p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->style1:I

    if-ne p2, p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x2

    :goto_0
    if-eqz p3, :cond_2

    .line 166
    sget p2, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-eq p1, p2, :cond_2

    .line 167
    sput p1, Lcom/flyersoft/tools/A;->shelfStyle:I

    .line 168
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 169
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_2
    return-void
.end method

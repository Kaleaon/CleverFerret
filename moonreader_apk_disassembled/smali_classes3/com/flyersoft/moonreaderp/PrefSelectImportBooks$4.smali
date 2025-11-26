.class Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$4;
.super Ljava/lang/Object;
.source "PrefSelectImportBooks.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 156
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 159
    sput-boolean p2, Lcom/flyersoft/tools/A;->importIgnoreSame:Z

    return-void
.end method

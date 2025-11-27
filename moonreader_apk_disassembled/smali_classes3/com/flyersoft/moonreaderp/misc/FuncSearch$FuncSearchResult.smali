.class public Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;
.super Ljava/lang/Object;
.source "FuncSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/misc/FuncSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FuncSearchResult"
.end annotation


# instance fields
.field public dlg:Ljava/lang/Object;

.field public dlgTitle:Ljava/lang/String;

.field public targetTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 199
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlgTitle:Ljava/lang/String;

    .line 200
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    .line 201
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    return-void
.end method

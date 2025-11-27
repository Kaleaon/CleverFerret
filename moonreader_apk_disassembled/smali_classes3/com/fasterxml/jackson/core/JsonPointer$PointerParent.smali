.class Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;
.super Ljava/lang/Object;
.source "JsonPointer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/JsonPointer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PointerParent"
.end annotation


# instance fields
.field public final fullPathOffset:I

.field public final parent:Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;

.field public final segment:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;ILjava/lang/String;)V
    .locals 0

    .line 790
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 791
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;->parent:Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;

    .line 792
    iput p2, p0, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;->fullPathOffset:I

    .line 793
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonPointer$PointerParent;->segment:Ljava/lang/String;

    return-void
.end method
